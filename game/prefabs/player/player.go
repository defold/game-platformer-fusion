components {
  id: "player"
  component: "/game/prefabs/player/player.script"
}
components {
  id: "model_tiers"
  component: "/shadow_mapping/model_tiers.script"
  properties {
    id: "low_material"
    value: "/shadow_mapping/materials/low/diffuse_skinning.material"
    type: PROPERTY_TYPE_HASH
  }
  properties {
    id: "mid_material"
    value: "/shadow_mapping/materials/mid/diffuse_skinning.material"
    type: PROPERTY_TYPE_HASH
  }
  properties {
    id: "high_material"
    value: "/shadow_mapping/materials/high/diffuse_skinning.material"
    type: PROPERTY_TYPE_HASH
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.0\n"
  "restitution: 0.0\n"
  "group: \"player\"\n"
  "mask: \"platform\"\n"
  "mask: \"coin\"\n"
  "mask: \"flag\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "      y: 0.5\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "  }\n"
  "  data: 0.5\n"
  "}\n"
  "linear_damping: 0.9\n"
  ""
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/assets/models/kenney_platformer-kit/character-oobi.glb\"\n"
  "skeleton: \"/assets/models/kenney_platformer-kit/character-oobi.glb\"\n"
  "animations: \"/assets/models/kenney_platformer-kit/character-oobi.glb\"\n"
  "default_animation: \"idle\"\n"
  "name: \"{{NAME}}\"\n"
  "materials {\n"
  "  name: \"colormap\"\n"
  "  material: \"/shadow_mapping/materials/high/diffuse_skinning.material\"\n"
  "  textures {\n"
  "    sampler: \"tex0\"\n"
  "    texture: \"/assets/models/kenney_platformer-kit/Textures/colormap.png\"\n"
  "  }\n"
  "  textures {\n"
  "    sampler: \"tex_depth\"\n"
  "    texture: \"/assets/models/kenney_platformer-kit/Textures/colormap.png\"\n"
  "  }\n"
  "}\n"
  ""
}
