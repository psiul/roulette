select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,ship_mode sm,web_returns wr
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 652 and ws.ws_hash <= 985 and cd.cd_hash >= 219 and cd.cd_hash <= 969 and sm.sm_hash >= 494 and sm.sm_hash <= 894
;
