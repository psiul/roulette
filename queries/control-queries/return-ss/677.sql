select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 569 and i.i_hash <= 969 and d.d_hash >= 49 and d.d_hash <= 799 and cd.cd_hash >= 49 and cd.cd_hash <= 382
;
