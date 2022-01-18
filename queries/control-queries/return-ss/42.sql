select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 206 and ss.ss_hash <= 606 and d.d_hash >= 312 and d.d_hash <= 645 and cd.cd_hash >= 136 and cd.cd_hash <= 886
;
