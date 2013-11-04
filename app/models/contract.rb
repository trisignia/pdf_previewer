class Contract < ActiveRecord::Base
  include AASM

  monetize :monthly_value_cents
  monetize :total_value_cents

  acts_as_taggable rescue nil
  
  belongs_to :account

  has_many :pdf_files, :dependent => :destroy, :inverse_of => :contract,
    :autosave => true, :validate => true

  validates :account_id, :presence => true

  aasm do
    state :draft, :initial => true
    state :active
    state :action_required
    state :notice_given
    state :terminated
  end

  def self.states(reject_terminated = true)
    states = Contract.aasm.states.map(&:name)
    states = states - [:terminated] if reject_terminated
    states.map(&:to_s)
  end

  def self.total_value
    Money.new(sum(:total_value_cents))
  end

  def set_state(state)
    update_attribute :aasm_state, state
  end

  def state
    aasm_state
  end

  def organization
  end

  def people
  end

end
