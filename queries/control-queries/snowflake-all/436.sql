select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,ship_mode sm,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 246 and ws.ws_hash <= 996 and hd.hd_hash >= 593 and hd.hd_hash <= 993 and cd.cd_hash >= 112 and cd.cd_hash <= 445
;
