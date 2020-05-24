class Collision
    def initialize(entities)
        @entities = entities
    end
    
    def collision_detection(entities)
        entities.each do |entity|
            entities.each do |ent|
                if ent != entity
                    if ent.x <= entity.x && ent.x + ent.image_width >= entity.x && ent.y <= entity.y && ent.y + ent.image_height >= entity.y 
                        return true                    
                    end
                end
            end
        end
        return false
    end
    # TODO: Verify that the object do not get trapped due to it´s velocity
    def colliding? (entities)
        entities.each do |ent|
            if ent != self
                if ent.x <= self.x && ent.x + ent.image_width >= self.x && ent.y <= self.y && ent.y + ent.image_height >= self.y || self.x + self.image_width >= ent.x && self.x + self.image_width <= ent.x + ent.image_width && self.y >= ent.y && self.y + self.image_height <= ent.y + ent.image_height
                    return true                    
                end
            end
        end
        return false
    end
end
