select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer_demographics cd,ship_mode sm,item i
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_item_sk = i.i_item_sk and ws.ws_hash >= 151 and ws.ws_hash <= 901 and cd.cd_hash >= 530 and cd.cd_hash <= 930 and i.i_hash >= 655 and i.i_hash <= 988
;
