select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,warehouse w,web_returns wr
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 434 and ws.ws_hash <= 834 and cd.cd_hash >= 152 and cd.cd_hash <= 902 and sm.sm_hash >= 406 and sm.sm_hash <= 739
;
