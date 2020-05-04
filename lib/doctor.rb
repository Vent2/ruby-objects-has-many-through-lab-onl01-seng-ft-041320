class Doctor
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  @@all = []

  def self.all
    @@all
  end

  def new_appointment(date, patient)
     new_appointment = Appointment.new(date, patient, self) 
  end

  def appointments
    Appointment.all {|appointment| appointment.doctor == self}
  end

  def patients
    self.appointments.collect {|appointment| appointment.patient}
  end
end