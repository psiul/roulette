select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,household_demographics hd,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and d.d_hash >= 113 and d.d_hash <= 863 and cd.cd_hash >= 138 and cd.cd_hash <= 471 and hd.hd_hash >= 82 and hd.hd_hash <= 482
;
