select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,web_returns wr,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 397 and ws.ws_hash <= 797 and cd.cd_hash >= 66 and cd.cd_hash <= 816 and sm.sm_hash >= 429 and sm.sm_hash <= 762
;
