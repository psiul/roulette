select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,warehouse w,ship_mode sm
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 582 and ws.ws_hash <= 982 and cd.cd_hash >= 161 and cd.cd_hash <= 911 and hd.hd_hash >= 656 and hd.hd_hash <= 989
;
