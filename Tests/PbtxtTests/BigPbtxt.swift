
let bigPbtxt = """

node {
  name: "global_step/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 0
      }
    }
  }
}
node {
  name: "global_step"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "global_step/Assign"
  op: "Assign"
  input: "global_step"
  input: "global_step/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "global_step/read"
  op: "Identity"
  input: "global_step"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
}
node {
  name: "input"
  op: "Placeholder"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "output"
  op: "Placeholder"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.7320507764816284
      }
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.7320507764816284
      }
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "device_dummy_0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "device_dummy_0/Initializer/random_uniform/max"
  input: "device_dummy_0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "device_dummy_0/Initializer/random_uniform/RandomUniform"
  input: "device_dummy_0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "device_dummy_0/Initializer/random_uniform"
  op: "Add"
  input: "device_dummy_0/Initializer/random_uniform/mul"
  input: "device_dummy_0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "device_dummy_0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "device_dummy_0/Assign"
  op: "Assign"
  input: "device_dummy_0"
  input: "device_dummy_0/Initializer/random_uniform"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "device_dummy_0/read"
  op: "Identity"
  input: "device_dummy_0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.7320507764816284
      }
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.7320507764816284
      }
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "device_dummy_1/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform/sub"
  op: "Sub"
  input: "device_dummy_1/Initializer/random_uniform/max"
  input: "device_dummy_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform/mul"
  op: "Mul"
  input: "device_dummy_1/Initializer/random_uniform/RandomUniform"
  input: "device_dummy_1/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "device_dummy_1/Initializer/random_uniform"
  op: "Add"
  input: "device_dummy_1/Initializer/random_uniform/mul"
  input: "device_dummy_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "device_dummy_1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "device_dummy_1/Assign"
  op: "Assign"
  input: "device_dummy_1"
  input: "device_dummy_1/Initializer/random_uniform"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "device_dummy_1/read"
  op: "Identity"
  input: "device_dummy_1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@device_dummy_1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "tree-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
        int_val: -2
      }
    }
  }
}
node {
  name: "tree-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "tree-0/Assign"
  op: "Assign"
  input: "tree-0"
  input: "tree-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "tree-0/read"
  op: "Identity"
  input: "tree-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
}
node {
  name: "tree_thresholds-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "tree_thresholds-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "tree_thresholds-0/Assign"
  op: "Assign"
  input: "tree_thresholds-0"
  input: "tree_thresholds-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "tree_thresholds-0/read"
  op: "Identity"
  input: "tree_thresholds-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "Const"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "end_of_tree-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "end_of_tree-0/Assign"
  op: "Assign"
  input: "end_of_tree-0"
  input: "Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@end_of_tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "end_of_tree-0/read"
  op: "Identity"
  input: "end_of_tree-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@end_of_tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
}
node {
  name: "start_epoch-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 10
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "start_epoch-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "start_epoch-0/Assign"
  op: "Assign"
  input: "start_epoch-0"
  input: "start_epoch-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "start_epoch-0/read"
  op: "Identity"
  input: "start_epoch-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "node_to_accumulator_map-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 10
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "node_to_accumulator_map-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "node_to_accumulator_map-0/Assign"
  op: "Assign"
  input: "node_to_accumulator_map-0"
  input: "node_to_accumulator_map-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "node_to_accumulator_map-0/read"
  op: "Identity"
  input: "node_to_accumulator_map-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "accumulator_to_node_map-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 5
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "accumulator_to_node_map-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "accumulator_to_node_map-0/Assign"
  op: "Assign"
  input: "accumulator_to_node_map-0"
  input: "accumulator_to_node_map-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "accumulator_to_node_map-0/read"
  op: "Identity"
  input: "accumulator_to_node_map-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
}
node {
  name: "candidate_split_features-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "candidate_split_features-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "candidate_split_features-0/Assign"
  op: "Assign"
  input: "candidate_split_features-0"
  input: "candidate_split_features-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "candidate_split_features-0/read"
  op: "Identity"
  input: "candidate_split_features-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "candidate_split_thresholds-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "candidate_split_thresholds-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "candidate_split_thresholds-0/Assign"
  op: "Assign"
  input: "candidate_split_thresholds-0"
  input: "candidate_split_thresholds-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "candidate_split_thresholds-0/read"
  op: "Identity"
  input: "candidate_split_thresholds-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "node_sums-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "node_sums-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "node_sums-0/Assign"
  op: "Assign"
  input: "node_sums-0"
  input: "node_sums-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "node_sums-0/read"
  op: "Identity"
  input: "node_sums-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "candidate_split_sums-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "candidate_split_sums-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "candidate_split_sums-0/Assign"
  op: "Assign"
  input: "candidate_split_sums-0"
  input: "candidate_split_sums-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "candidate_split_sums-0/read"
  op: "Identity"
  input: "candidate_split_sums-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "accumulator_sums-0/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "accumulator_sums-0"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "accumulator_sums-0/Assign"
  op: "Assign"
  input: "accumulator_sums-0"
  input: "accumulator_sums-0/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "accumulator_sums-0/read"
  op: "Identity"
  input: "accumulator_sums-0"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "node_squares-0"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "candidate_split_squares-0"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "accumulator_squares-0"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "tree-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
        int_val: -2
      }
    }
  }
}
node {
  name: "tree-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "tree-1/Assign"
  op: "Assign"
  input: "tree-1"
  input: "tree-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "tree-1/read"
  op: "Identity"
  input: "tree-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
}
node {
  name: "tree_thresholds-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "tree_thresholds-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "tree_thresholds-1/Assign"
  op: "Assign"
  input: "tree_thresholds-1"
  input: "tree_thresholds-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "tree_thresholds-1/read"
  op: "Identity"
  input: "tree_thresholds-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "end_of_tree-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "end_of_tree-1/Assign"
  op: "Assign"
  input: "end_of_tree-1"
  input: "Const_1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@end_of_tree-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "end_of_tree-1/read"
  op: "Identity"
  input: "end_of_tree-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@end_of_tree-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
}
node {
  name: "start_epoch-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 10
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "start_epoch-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "start_epoch-1/Assign"
  op: "Assign"
  input: "start_epoch-1"
  input: "start_epoch-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "start_epoch-1/read"
  op: "Identity"
  input: "start_epoch-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@start_epoch-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "node_to_accumulator_map-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 10
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "node_to_accumulator_map-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "node_to_accumulator_map-1/Assign"
  op: "Assign"
  input: "node_to_accumulator_map-1"
  input: "node_to_accumulator_map-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "node_to_accumulator_map-1/read"
  op: "Identity"
  input: "node_to_accumulator_map-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_to_accumulator_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "accumulator_to_node_map-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 5
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "accumulator_to_node_map-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "accumulator_to_node_map-1/Assign"
  op: "Assign"
  input: "accumulator_to_node_map-1"
  input: "accumulator_to_node_map-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "accumulator_to_node_map-1/read"
  op: "Identity"
  input: "accumulator_to_node_map-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_to_node_map-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
        }
      }
    }
  }
}
node {
  name: "candidate_split_features-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "candidate_split_features-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "candidate_split_features-1/Assign"
  op: "Assign"
  input: "candidate_split_features-1"
  input: "candidate_split_features-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "candidate_split_features-1/read"
  op: "Identity"
  input: "candidate_split_features-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "candidate_split_thresholds-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "candidate_split_thresholds-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "candidate_split_thresholds-1/Assign"
  op: "Assign"
  input: "candidate_split_thresholds-1"
  input: "candidate_split_thresholds-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "candidate_split_thresholds-1/read"
  op: "Identity"
  input: "candidate_split_thresholds-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "node_sums-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "node_sums-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "node_sums-1/Assign"
  op: "Assign"
  input: "node_sums-1"
  input: "node_sums-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "node_sums-1/read"
  op: "Identity"
  input: "node_sums-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "candidate_split_sums-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "candidate_split_sums-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "candidate_split_sums-1/Assign"
  op: "Assign"
  input: "candidate_split_sums-1"
  input: "candidate_split_sums-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "candidate_split_sums-1/read"
  op: "Identity"
  input: "candidate_split_sums-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "accumulator_sums-1/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "accumulator_sums-1"
  op: "VariableV2"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "accumulator_sums-1/Assign"
  op: "Assign"
  input: "accumulator_sums-1"
  input: "accumulator_sums-1/Initializer/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "accumulator_sums-1/read"
  op: "Identity"
  input: "accumulator_sums-1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-1"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
}
node {
  name: "node_squares-1"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "candidate_split_squares-1"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "accumulator_squares-1"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "ones_like/tensor"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "ones_like/Shape"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "ones_like/Const"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ones_like"
  op: "Fill"
  input: "ones_like/Shape"
  input: "ones_like/Const"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
}
node {
  name: "StridedSlice/begin"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "StridedSlice/end"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "StridedSlice"
  op: "StridedSlice"
  input: "tree-0/read"
  input: "StridedSlice/begin"
  input: "StridedSlice/end"
  input: "ones_like"
  device: "/device:CPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "Squeeze"
  op: "Squeeze"
  input: "StridedSlice"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
      }
    }
  }
}
node {
  name: "Equal/y"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -2
      }
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "Squeeze"
  input: "Equal/y"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/Switch"
  op: "Switch"
  input: "Equal"
  input: "Equal"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/switch_t"
  op: "Identity"
  input: "cond/Switch:1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/switch_f"
  op: "Identity"
  input: "cond/Switch"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/pred_id"
  op: "Identity"
  input: "Equal"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/ScatterUpdate/indices"
  op: "Const"
  input: "^cond/switch_t"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "cond/ScatterUpdate/updates"
  op: "Const"
  input: "^cond/switch_t"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
}
node {
  name: "cond/ScatterUpdate/Switch"
  op: "RefSwitch"
  input: "tree-0"
  input: "cond/pred_id"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
}
node {
  name: "cond/ScatterUpdate"
  op: "ScatterUpdate"
  input: "cond/ScatterUpdate/Switch:1"
  input: "cond/ScatterUpdate/indices"
  input: "cond/ScatterUpdate/updates"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@tree-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
}
node {
  name: "cond/control_dependency"
  op: "Identity"
  input: "cond/switch_t"
  input: "^cond/ScatterUpdate"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@cond/switch_t"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/NoOp"
  op: "NoOp"
  input: "^cond/switch_f"
  device: "/device:CPU:0"
}
node {
  name: "cond/control_dependency_1"
  op: "Identity"
  input: "cond/switch_f"
  input: "^cond/NoOp"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@cond/switch_f"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
      }
    }
  }
}
node {
  name: "cond/Merge"
  op: "Merge"
  input: "cond/control_dependency_1"
  input: "cond/control_dependency"
  device: "/device:CPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          unknown_rank: true
        }
        shape {
        }
      }
    }
  }
}
node {
  name: "ToInt32/x"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "CountExtremelyRandomStats/sparse_input_indices"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "CountExtremelyRandomStats/sparse_input_values"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "CountExtremelyRandomStats/sparse_input_shape"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "CountExtremelyRandomStats/input_weights"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "CountExtremelyRandomStats"
  op: "CountExtremelyRandomStats"
  input: "input"
  input: "CountExtremelyRandomStats/sparse_input_indices"
  input: "CountExtremelyRandomStats/sparse_input_values"
  input: "CountExtremelyRandomStats/sparse_input_shape"
  input: "output"
  input: "CountExtremelyRandomStats/input_weights"
  input: "tree-0/read"
  input: "tree_thresholds-0/read"
  input: "node_to_accumulator_map-0/read"
  input: "candidate_split_features-0/read"
  input: "candidate_split_thresholds-0/read"
  input: "start_epoch-0/read"
  input: "ToInt32/x"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
        shape {
          dim {
            size: -1
          }
          dim {
            size: 3
          }
        }
        shape {
          dim {
            size: -1
          }
        }
        shape {
          dim {
          }
        }
        shape {
          dim {
            size: -1
          }
          dim {
            size: 2
          }
        }
        shape {
          dim {
            size: -1
          }
        }
        shape {
          dim {
          }
        }
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
  attr {
    key: "input_spec"
    value {
      s: "dense_features_size: 4 dense: [{name: dense_features original_type: 0 size: 4}] sparse: []"
    }
  }
  attr {
    key: "num_classes"
    value {
      i: 4
    }
  }
  attr {
    key: "regression"
    value {
      b: false
    }
  }
}
node {
  name: "AssignAdd"
  op: "AssignAdd"
  input: "node_sums-0"
  input: "CountExtremelyRandomStats"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@node_sums-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "ScatterAddNdim"
  op: "ScatterAddNdim"
  input: "candidate_split_sums-0"
  input: "CountExtremelyRandomStats:2"
  input: "CountExtremelyRandomStats:3"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_sums-0"
      }
    }
  }
}
node {
  name: "ScatterAddNdim_1"
  op: "ScatterAddNdim"
  input: "accumulator_sums-0"
  input: "CountExtremelyRandomStats:5"
  input: "CountExtremelyRandomStats:6"
  device: "/device:CPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accumulator_sums-0"
      }
    }
  }
}
node {
  name: "SampleInputs/sparse_input_indices"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "SampleInputs/sparse_input_values"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "SampleInputs/sparse_input_shape"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "SampleInputs/input_weights"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "SampleInputs"
  op: "SampleInputs"
  input: "input"
  input: "SampleInputs/sparse_input_indices"
  input: "SampleInputs/sparse_input_values"
  input: "SampleInputs/sparse_input_shape"
  input: "SampleInputs/input_weights"
  input: "node_to_accumulator_map-0/read"
  input: "CountExtremelyRandomStats:8"
  input: "candidate_split_features-0/read"
  input: "candidate_split_thresholds-0/read"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
        shape {
          dim {
            size: -1
          }
          dim {
            size: 4
          }
        }
        shape {
          dim {
            size: -1
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "input_spec"
    value {
      s: "dense_features_size: 4 dense: [{name: dense_features original_type: 0 size: 4}] sparse: []"
    }
  }
  attr {
    key: "split_initializations_per_input"
    value {
      i: 1
    }
  }
  attr {
    key: "split_sampling_random_seed"
    value {
      i: 0
    }
  }
}
node {
  name: "ScatterUpdate"
  op: "ScatterUpdate"
  input: "candidate_split_features-0"
  input: "SampleInputs"
  input: "SampleInputs:1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_features-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
}
node {
  name: "ScatterUpdate_1"
  op: "ScatterUpdate"
  input: "candidate_split_thresholds-0"
  input: "SampleInputs"
  input: "SampleInputs:2"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@candidate_split_thresholds-0"
      }
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 5
          }
          dim {
            size: 4
          }
        }
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
}
node {
  name: "FinishedNodes"
  op: "FinishedNodes"
  input: "CountExtremelyRandomStats:8"
  input: "node_to_accumulator_map-0/read"
  input: "candidate_split_sums-0/read"
  input: "candidate_split_squares-0"
  input: "accumulator_sums-0/read"
  input: "accumulator_squares-0"
  input: "start_epoch-0/read"
  input: "ToInt32/x"
  input: "^ScatterAddNdim"
  input: "^ScatterAddNdim_1"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
  attr {
    key: "check_dominates_every_samples"
    value {
      i: 75
    }
  }
  attr {
    key: "dominate_fraction"
    value {
      f: 0.9900000095367432
    }
  }
  attr {
    key: "dominate_method"
    value {
      s: "bootstrap"
    }
  }
  attr {
    key: "min_split_samples"
    value {
      i: 5
    }
  }
  attr {
    key: "num_split_after_samples"
    value {
      i: 50
    }
  }
  attr {
    key: "random_seed"
    value {
      i: 0
    }
  }
  attr {
    key: "regression"
    value {
      b: false
    }
  }
}
node {
  name: "Slice/begin"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "Slice/size"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
      }
    }
  }
}
node {
  name: "Slice"
  op: "Slice"
  input: "tree-0/read"
  input: "Slice/begin"
  input: "Slice/size"
  device: "/device:CPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
          dim {
            size: 1
          }
        }
      }
    }
  }
}
node {
  name: "Squeeze_1"
  op: "Squeeze"
  input: "Slice"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 1
      }
    }
  }
}
node {
  name: "Equal_1/x"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "Equal_1"
  op: "Equal"
  input: "Equal_1/x"
  input: "Squeeze_1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 10
          }
        }
      }
    }
  }
}
node {
  name: "Where"
  op: "Where"
  input: "Equal_1"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
          dim {
            size: 1
          }
        }
      }
    }
  }
}
node {
  name: "Squeeze_2"
  op: "Squeeze"
  input: "Where"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 1
      }
    }
  }
}
node {
  name: "ToInt32_1"
  op: "Cast"
  input: "Squeeze_2"
  device: "/device:CPU:0"
  attr {
    key: "DstT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
}
node {
  name: "Gather"
  op: "Gather"
  input: "node_to_accumulator_map-0/read"
  input: "ToInt32_1"
  device: "/device:CPU:0"
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
  attr {
    key: "validate_indices"
    value {
      b: true
    }
  }
}
node {
  name: "Less/y"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Less"
  op: "Less"
  input: "Gather"
  input: "Less/y"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: -1
          }
        }
      }
    }
  }
}
node {
  name: "boolean_mask/Shape"
  op: "Shape"
  input: "ToInt32_1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "boolean_mask/strided_slice/stack"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "boolean_mask/strided_slice/stack_1"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "boolean_mask/strided_slice/stack_2"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "boolean_mask/strided_slice"
  op: "StridedSlice"
  input: "boolean_mask/Shape"
  input: "boolean_mask/strided_slice/stack"
  input: "boolean_mask/strided_slice/stack_1"
  input: "boolean_mask/strided_slice/stack_2"
  device: "/device:CPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "boolean_mask/Prod/reduction_indices"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "boolean_mask/Prod"
  op: "Prod"
  input: "boolean_mask/strided_slice"
  input: "boolean_mask/Prod/reduction_indices"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "boolean_mask/Shape_1"
  op: "Shape"
  input: "ToInt32_1"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "boolean_mask/strided_slice_1/stack"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "boolean_mask/strided_slice_1/stack_1"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "boolean_mask/strided_slice_1/stack_2"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "boolean_mask/strided_slice_1"
  op: "StridedSlice"
  input: "boolean_mask/Shape_1"
  input: "boolean_mask/strided_slice_1/stack"
  input: "boolean_mask/strided_slice_1/stack_1"
  input: "boolean_mask/strided_slice_1/stack_2"
  device: "/device:CPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
          }
        }
      }
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "boolean_mask/concat/values_0"
  op: "Pack"
  input: "boolean_mask/Prod"
  device: "/device:CPU:0"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "boolean_mask/concat/axis"
  op: "Const"
  input: "^cond/Merge"
  device: "/device:CPU:0"
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
        }
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "boolean_mask/concat"
  op: "ConcatV2"
  input: "boolean_mask/concat/values_0"
  input: "boolean_mask/strided_slice_1"
  input: "boolean_mask/concat/axis"
  device: "/device:CPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_output_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
}

"""
