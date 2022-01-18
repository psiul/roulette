select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 294 and i.i_hash <= 627 and d.d_hash >= 31 and d.d_hash <= 781 and cd.cd_hash >= 330 and cd.cd_hash <= 730
;
