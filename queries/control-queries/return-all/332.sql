select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 397 and d.d_hash <= 797 and i.i_hash >= 124 and i.i_hash <= 874 and cd.cd_hash >= 24 and cd.cd_hash <= 357
;
