select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,household_demographics hd,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 18 and ws.ws_hash <= 418 and hd.hd_hash >= 216 and hd.hd_hash <= 966 and cd.cd_hash >= 379 and cd.cd_hash <= 712
;
