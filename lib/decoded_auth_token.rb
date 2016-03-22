# {"user_id"=>6}

class DecodedAuthToken < HashWithIndifferentAccess
  def expired?
    self[:exp] <= Time.now.to_i
  end
end