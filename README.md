Create a seperate field for user_type if they have free lancer type they are taken to the right page

rails g migration AddUserTypeToUser user_type

<!--
    rails g rolify Role User

    rails db:migrate

    rails g migration AddUserTypeToUser user_type

    update the devise new field to have a user_type field

    go to home index and make the button have the path with the parameters attached to it eg.

    <a class="btn btn-primary btn-lg" href="/user/sign_up?user_type=freelancer" role="button">Create your profile &raquo;</a>

    go back to views/devise/registrations/new and write
      <% if params[:user_type] %>
        <%= f.input :user_type, input_html: { value: params[:user_type] } %>
      <% end %>

    application_controller.rb

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
     end

     user.rb

     after_create :assign_role

     def assign_role
       self.add_role self.user_type.to_sym
     end

     create a test user and check it has the role freelancer in the rails c

     User.last

     User.last.has_role? :freelancer

     rails g scaffold FreelancerProfile user:belongs_to first_name last_name phone suburb postcode country latitude:float longitude:float picture bio:text

     add carrierwave gem and cloudinary

     Bundle

     go to cloudinary download cloudinary.yml file and add it to config/initializers

     rails g uploader FreelancerProfilePicture

     app/uploaders/freelancer_profile_picture_uploader.rb

       include Cloudinary::CarrierWave

    freelancer.rb

    mount_uploader :picture, FreelancerProfilePictureUploader

    update app/views/freelancer_profile/show.html.erb

    <div class="container">
      <div class="row text">
        <div class="col-4 ml-auto mr-auto">
          <div class="card">
            <img src="<%= @freelancer_profile.picture %>" class="card-img-top" alt="">
            <div class="card-body">
              <h5><%= @freelancer_profile.full_name %></h5>
              <p class="card-text"><%= @freelancer_profile.bio %></p>
              <% if @freelancer_profile.user == current_user %>
                <p><%= link_to 'Edit', edit_freelancer_profile_path(@freelancer_profile), class: 'btn btn-outline-warning btn-sm' %></p>
              <% end %>
            </div>

          </div>

        </div>

      </div>

    </div>


    <p id="notice"><%= notice %></p>

    in models/freeelancer_profile.rb

    def full_name
      [first_name, last_name].join(' ')
    end

    Add geocoder gem

    #Add steps

    Add gem friendly_id

    rails g friendly_id

    rails g migration AddSlugToFreelancerProfile slug:uniq

    Add the below to the freelancer_profile model

    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    <!-- The below will appear in order based on users with the same name etc... -->

<!--
    def slug_candidates
      [
        [:full_name],
        [:full_name, :suburb, :country],
        [:full_name, :suburb, :postcode, :country]
      ]
    end

    To add the friendly id to all the existing users use the below command in the rails c
    FreelancerProfile.find_each(&:save)


-->
