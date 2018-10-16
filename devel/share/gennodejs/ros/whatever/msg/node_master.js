// Auto-generated. Do not edit!

// (in-package whatever.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class node_master {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.override_status = null;
      this.pid_status = null;
      this.simple_manuver = null;
      this.simple_speed = null;
      this.recorder = null;
      this.player = null;
    }
    else {
      if (initObj.hasOwnProperty('override_status')) {
        this.override_status = initObj.override_status
      }
      else {
        this.override_status = false;
      }
      if (initObj.hasOwnProperty('pid_status')) {
        this.pid_status = initObj.pid_status
      }
      else {
        this.pid_status = false;
      }
      if (initObj.hasOwnProperty('simple_manuver')) {
        this.simple_manuver = initObj.simple_manuver
      }
      else {
        this.simple_manuver = false;
      }
      if (initObj.hasOwnProperty('simple_speed')) {
        this.simple_speed = initObj.simple_speed
      }
      else {
        this.simple_speed = false;
      }
      if (initObj.hasOwnProperty('recorder')) {
        this.recorder = initObj.recorder
      }
      else {
        this.recorder = false;
      }
      if (initObj.hasOwnProperty('player')) {
        this.player = initObj.player
      }
      else {
        this.player = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type node_master
    // Serialize message field [override_status]
    bufferOffset = _serializer.bool(obj.override_status, buffer, bufferOffset);
    // Serialize message field [pid_status]
    bufferOffset = _serializer.bool(obj.pid_status, buffer, bufferOffset);
    // Serialize message field [simple_manuver]
    bufferOffset = _serializer.bool(obj.simple_manuver, buffer, bufferOffset);
    // Serialize message field [simple_speed]
    bufferOffset = _serializer.bool(obj.simple_speed, buffer, bufferOffset);
    // Serialize message field [recorder]
    bufferOffset = _serializer.bool(obj.recorder, buffer, bufferOffset);
    // Serialize message field [player]
    bufferOffset = _serializer.bool(obj.player, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type node_master
    let len;
    let data = new node_master(null);
    // Deserialize message field [override_status]
    data.override_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pid_status]
    data.pid_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [simple_manuver]
    data.simple_manuver = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [simple_speed]
    data.simple_speed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [recorder]
    data.recorder = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [player]
    data.player = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/node_master';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e8dbc3cc1533c62f04e54d76742a542b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool override_status
    bool pid_status
    bool simple_manuver
    bool simple_speed
    bool recorder
    bool player
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new node_master(null);
    if (msg.override_status !== undefined) {
      resolved.override_status = msg.override_status;
    }
    else {
      resolved.override_status = false
    }

    if (msg.pid_status !== undefined) {
      resolved.pid_status = msg.pid_status;
    }
    else {
      resolved.pid_status = false
    }

    if (msg.simple_manuver !== undefined) {
      resolved.simple_manuver = msg.simple_manuver;
    }
    else {
      resolved.simple_manuver = false
    }

    if (msg.simple_speed !== undefined) {
      resolved.simple_speed = msg.simple_speed;
    }
    else {
      resolved.simple_speed = false
    }

    if (msg.recorder !== undefined) {
      resolved.recorder = msg.recorder;
    }
    else {
      resolved.recorder = false
    }

    if (msg.player !== undefined) {
      resolved.player = msg.player;
    }
    else {
      resolved.player = false
    }

    return resolved;
    }
};

module.exports = node_master;
