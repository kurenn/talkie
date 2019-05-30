def sign_in(user)
  allow_any_instance_of(Talkie::ApplicationController).to receive(:current_user).and_return(user)
end

def sign_out
  allow_any_instance_of(Talkie::ApplicationController).to receive(:current_user).and_return(nil)
end
