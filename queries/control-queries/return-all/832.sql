select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer_demographics cd,warehouse w,ship_mode sm
where ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 47 and ws.ws_hash <= 447 and cd.cd_hash >= 56 and cd.cd_hash <= 806 and sm.sm_hash >= 440 and sm.sm_hash <= 773
;
