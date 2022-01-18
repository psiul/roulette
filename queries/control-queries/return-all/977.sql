select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,web_returns wr,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_item_sk = i.i_item_sk and d.d_hash >= 172 and d.d_hash <= 505 and cd.cd_hash >= 104 and cd.cd_hash <= 854 and i.i_hash >= 517 and i.i_hash <= 917
;
