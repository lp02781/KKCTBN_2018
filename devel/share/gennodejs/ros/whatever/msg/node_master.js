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
      this.rc_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('override_status')) {
        this.override_status = initObj.override_status
      }
      else {
        this.override_status = false;
      }
      if (initObj.hasOwnProperty('rc_flag')) {
        this.rc_flag = initObj.rc_flag
      }
      else {
        this.rc_flag = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type node_master
    // Serialize message field [override_status]
    bufferOffset = _serializer.bool(obj.override_status, buffer, bufferOffset);
    // Serialize message field [rc_flag]
    bufferOffset = _serializer.int16(obj.rc_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type node_master
    let len;
    let data = new node_master(null);
    // Deserialize message field [override_status]
    data.override_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rc_flag]
    data.rc_flag = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/node_master';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2e6fced663cb3e5fee5dab7b6365bb07';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool override_status
    int16 rc_flag
    
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

    if (msg.rc_flag !== undefined) {
      resolved.rc_flag = msg.rc_flag;
    }
    else {
      resolved.rc_flag = 0
    }

    return resolved;
    }
};

module.exports = node_master;
