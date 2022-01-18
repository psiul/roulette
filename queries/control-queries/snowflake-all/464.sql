select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,household_demographics hd,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 151 and ws.ws_hash <= 901 and sm.sm_hash >= 589 and sm.sm_hash <= 989 and hd.hd_hash >= 327 and hd.hd_hash <= 660
;
