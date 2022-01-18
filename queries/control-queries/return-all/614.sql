select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,web_returns wr,customer_demographics cd,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 379 and ws.ws_hash <= 712 and sm.sm_hash >= 319 and sm.sm_hash <= 719 and cd.cd_hash >= 231 and cd.cd_hash <= 981
;
