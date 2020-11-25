class Admin::FreshDesksController < ApplicationController
  require "freshdesk"

  before_action :initialize_freshhdesk

  def index
    # lists all tickets
    # Freshdesk::Ticket.list_all_tickets
    redirect_to_freshdesk
  end

  def create
    # creates a ticket
    params = {
        status: 2,
        priority: 1,
        description: "test ticket creation with attachments",
        subject: "new ticket sample #{Time.now}",
        cc_emails: ["test+1@example.com"],
        email: "test@example.com",

    }
    Freshdesk::Ticket.create_a_ticket(params: params)
  end

  def show
    # returns a ticket
    res = Freshdesk::Ticket.view_a_ticket(id: 19)
    # Freshdesk::Ticket.singleton_methods(false) return RestClient::Response instance
    res.class.name
    # => RestClient::Response
    res.code
    # => 200
    response_hash = JSON.parse(res.body)
  end


  private

  def initialize_freshhdesk
    Freshdesk.domain = "gullah.freshdesk.com"
    Freshdesk.user_name_or_api_key = "eVYpBBlWV6tKYaGKd2Pa"
    Freshdesk.password_or_x = "Evpaz78w"
  end

end
