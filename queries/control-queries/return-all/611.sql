select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,household_demographics hd,ship_mode sm
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 80 and ws.ws_hash <= 830 and cd.cd_hash >= 534 and cd.cd_hash <= 867 and hd.hd_hash >= 96 and hd.hd_hash <= 496
;
