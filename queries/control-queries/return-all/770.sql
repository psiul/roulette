select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,store_returns sr,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 30 and ss.ss_hash <= 780 and i.i_hash >= 305 and i.i_hash <= 638 and cd.cd_hash >= 326 and cd.cd_hash <= 726
;
