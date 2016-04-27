class VisitHandler
  def self.create_visit(user, visit_params, contents)
    visit = user.visits.new(visit_params)
    create_animal_visits(visit, contents)
    visit
  end

  def self.create_animal_visits(visit, visit_info)
    visit_info.each do |info|
      AnimalVisit.create(
        animal_id: info.first.to_i,
        visit: visit,
        duration: info.last
      )
    end
  end

  def self.verify(visit, visitation)
    if visit.valid?
      visitation.contents.clear
      [true, "Visit was successfully scheduled"]
    else
      if visit.date && visit.date < Time.new
        message = "Visit must be scheduled a day in advance"
      else
        [false, "Failed to schedule visit"]
      end
    end
  end
end
