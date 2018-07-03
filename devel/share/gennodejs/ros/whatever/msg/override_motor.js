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

class override_motor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
      this.setpoint = null;
      this.steering = null;
      this.throttle = null;
      this.header = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
      if (initObj.hasOwnProperty('setpoint')) {
        this.setpoint = initObj.setpoint
      }
      else {
        this.setpoint = 0;
      }
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0;
      }
      if (initObj.hasOwnProperty('throttle')) {
        this.throttle = initObj.throttle
      }
      else {
        this.throttle = 0;
      }
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type override_motor
    // Serialize message field [state]
    bufferOffset = _serializer.int16(obj.state, buffer, bufferOffset);
    // Serialize message field [setpoint]
    bufferOffset = _serializer.int16(obj.setpoint, buffer, bufferOffset);
    // Serialize message field [steering]
    bufferOffset = _serializer.int16(obj.steering, buffer, bufferOffset);
    // Serialize message field [throttle]
    bufferOffset = _serializer.int16(obj.throttle, buffer, bufferOffset);
    // Serialize message field [header]
    bufferOffset = _serializer.int16(obj.header, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type override_motor
    let len;
    let data = new override_motor(null);
    // Deserialize message field [state]
    data.state = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [setpoint]
    data.setpoint = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [steering]
    data.steering = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [throttle]
    data.throttle = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [header]
    data.header = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/override_motor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '376bcc9dcf6eae1af3cfb5ce0f3af536';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 state
    int16 setpoint
    int16 steering
    int16 throttle
    int16 header
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new override_motor(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    if (msg.setpoint !== undefined) {
      resolved.setpoint = msg.setpoint;
    }
    else {
      resolved.setpoint = 0
    }

    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0
    }

    if (msg.throttle !== undefined) {
      resolved.throttle = msg.throttle;
    }
    else {
      resolved.throttle = 0
    }

    if (msg.header !== undefined) {
      resolved.header = msg.header;
    }
    else {
      resolved.header = 0
    }

    return resolved;
    }
};

module.exports = override_motor;
