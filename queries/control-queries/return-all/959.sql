select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,web_returns wr,ship_mode sm,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 408 and ws.ws_hash <= 741 and cd.cd_hash >= 153 and cd.cd_hash <= 553 and i.i_hash >= 66 and i.i_hash <= 816
;
