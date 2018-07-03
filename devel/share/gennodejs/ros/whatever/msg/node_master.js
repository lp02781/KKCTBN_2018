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
      this.rc_number = null;
      this.flight_mode = null;
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
      if (initObj.hasOwnProperty('rc_number')) {
        this.rc_number = initObj.rc_number
      }
      else {
        this.rc_number = 0;
      }
      if (initObj.hasOwnProperty('flight_mode')) {
        this.flight_mode = initObj.flight_mode
      }
      else {
        this.flight_mode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type node_master
    // Serialize message field [override_status]
    bufferOffset = _serializer.bool(obj.override_status, buffer, bufferOffset);
    // Serialize message field [pid_status]
    bufferOffset = _serializer.bool(obj.pid_status, buffer, bufferOffset);
    // Serialize message field [rc_number]
    bufferOffset = _serializer.int16(obj.rc_number, buffer, bufferOffset);
    // Serialize message field [flight_mode]
    bufferOffset = _serializer.string(obj.flight_mode, buffer, bufferOffset);
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
    // Deserialize message field [rc_number]
    data.rc_number = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [flight_mode]
    data.flight_mode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.flight_mode.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/node_master';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f3657994b0c8ed8f1919100c99067da';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool override_status
    bool pid_status
    int16 rc_number
    string flight_mode
    
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

    if (msg.rc_number !== undefined) {
      resolved.rc_number = msg.rc_number;
    }
    else {
      resolved.rc_number = 0
    }

    if (msg.flight_mode !== undefined) {
      resolved.flight_mode = msg.flight_mode;
    }
    else {
      resolved.flight_mode = ''
    }

    return resolved;
    }
};

module.exports = node_master;
