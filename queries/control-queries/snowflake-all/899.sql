select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,ship_mode sm,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 69 and d.d_hash <= 819 and hd.hd_hash >= 139 and hd.hd_hash <= 539 and sm.sm_hash >= 272 and sm.sm_hash <= 605
;
