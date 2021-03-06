# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-associations.rb

# 1. write code to display each contact (you can reuse the previous lab's code) and include the contact's company name, e.g.:

# ---------------------------------
# Contacts: 4
# Andy Jassy - andy@amazon.com - Amazon.com, Inc.
# Craig Federighi - craig@apple.com - Apple Inc.
# Elon Musk - elon@tesla.com - Tesla, Inc.
# Tim Cook - tim@apple.com - Apple Inc.

amazon = Company.where({name: "Amazon.com, Inc."})[0]
amazon_id = amazon.id

contact = Contact.new
contact.first_name = "Andy"
contact.last_name = "Jassy"
contact.email = "andy@amazon.com"
contact.phone_number = "0123456789"
contact.company_id = amazon_id
contact.save

apple = Company.where({name: "Apple Inc."})[0]
apple_id = apple.id

contact = Contact.new
contact.first_name = "Craig"
contact.last_name = "Federighi"
contact.email = "craig@apple.com"
contact.phone_number = "0123456789"
contact.company_id = apple_id
contact.save


# 2. similar to above, but this time organized by company, write code to display each company (name) and its contacts, e.g.:

# ---------------------------------
# Apple Inc.
# Tim Cook - tim@apple.com
# Craig Federighi - craig@apple.com
#
# Amazon.com, Inc.
# Andy Jassy - andy@amazon.com
#
# Tesla, Inc.
# Elon Musk - elon@tesla.com

companies = Company.all
for company in companies
    puts company.name
    for contact in company.contacts
        puts "#{contact.first_name} #{contact.last_name} - #{contact.email}"
    end
end
