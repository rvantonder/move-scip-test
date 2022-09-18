// Copyright (c) 2022, Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

#[test_only]
module sui::id_tests {
    use sui::object;
    use sui::tx_context;

    const ID_BYTES_MISMATCH: u64 = 0;

    struct Object has key {
        id: object::UID,
    }

    #[test]
    fun test_get_id() {
        let ctx = tx_context::dummy();
        let id = object::new(&mut ctx);
        let obj_id = object::uid_to_inner(&id);
        let obj = Object { id };
        assert!(object::id(&obj) == obj_id, ID_BYTES_MISMATCH);
        let Object { id } = obj;
        object::delete(id);
    }
}
