select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 183 and cd.cd_hash <= 933 and i.i_hash >= 171 and i.i_hash <= 504 and d.d_hash >= 210 and d.d_hash <= 610
;
