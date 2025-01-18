ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Welcome Message
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Product Statistics
    columns do
      column do
        panel "Product Statistics" do
          ul do
            li "Total Products: #{Product.count}"
            li "Average Price: #{Product.average(:price).try(:round, 2) || 'N/A'}"
            li "Most Expensive Product: #{Product.order(price: :desc).first&.name || 'N/A'}"
            li "Cheapest Product: #{Product.order(price: :asc).first&.name || 'N/A'}"
          end
        end
      end

      column do
        panel "Admin Statistics" do
          ul do
            li "Total Admin Users: #{AdminUser.count}"
            li "Last Signed-In Admin: #{AdminUser.order(updated_at: :desc).first&.name || 'N/A'}"
          end
        end
      end
    end

    # Recent Products
    panel "Recent Products" do
      table_for Product.order(created_at: :desc).limit(5) do
        column("Name") { |product| link_to product.name, admin_product_path(product) }
        column("Price") { |product| number_to_currency(product.price) }
        column("Created At") { |product| product.created_at.strftime("%B %d, %Y") }
      end
      div do
        link_to "View All Products", admin_products_path, class: "button"
      end
    end

    # Quick Links
    columns do
      column do
        panel "Quick Links" do
          ul do
            li link_to "Add a New Product", new_admin_product_path
            li link_to "View All Products", admin_products_path
            li link_to "View All Admin Users", admin_admin_users_path
          end
        end
      end

      column do
        panel "Help & Documentation" do
          ul do
            li link_to "ActiveAdmin Documentation", "https://activeadmin.info/", target: "_blank"
            li link_to "Rails Guides", "https://guides.rubyonrails.org/", target: "_blank"
            li link_to "Contact Support", "#", target: "_blank"
          end
        end
      end
    end
  end
end
