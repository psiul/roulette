select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,date_dim d,household_demographics hd
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 28 and cd.cd_hash <= 361 and i.i_hash >= 211 and i.i_hash <= 961 and d.d_hash >= 174 and d.d_hash <= 574
;
