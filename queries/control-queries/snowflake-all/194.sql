select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,household_demographics hd,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 91 and ws.ws_hash <= 841 and sm.sm_hash >= 262 and sm.sm_hash <= 595 and hd.hd_hash >= 43 and hd.hd_hash <= 443
;
