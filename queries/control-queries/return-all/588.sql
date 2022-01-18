select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer_demographics cd,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and i.i_hash >= 235 and i.i_hash <= 635 and d.d_hash >= 107 and d.d_hash <= 857 and cd.cd_hash >= 214 and cd.cd_hash <= 547
;
