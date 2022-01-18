select count(ws.ws_item_sk)
from web_sales ws,warehouse w,web_returns wr,customer_demographics cd,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 477 and ws.ws_hash <= 810 and cd.cd_hash >= 166 and cd.cd_hash <= 916 and sm.sm_hash >= 165 and sm.sm_hash <= 565
;
