select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 589 and ss.ss_hash <= 922 and i.i_hash >= 210 and i.i_hash <= 960 and d.d_hash >= 291 and d.d_hash <= 691
;
