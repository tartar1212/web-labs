# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# controller for all client app actions
class ClientController < ApplicationController
  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output
  def input; end

  def output
    response = open(@url)

    if @side == 'server'
      @result = server_xslt(response).to_html
    elsif @side == 'client-xslt'
      render xml: browser_xslt(response).to_xml
    else
      render xml: response
    end
  end

  private

  BASE_API_URL = 'http://localhost:3000/?format=xml'
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/parser.xslt"
  XSLT_BROWSER_TRANSFORM = '/parser.xslt'

  def parse_params
    @sequence = params[:search_range]
    @side = params[:side]
  end

  def prepare_url
    @url = BASE_API_URL + "&search_range=#{@sequence}"
  end

  def server_xslt(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
