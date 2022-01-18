select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 140 and ss.ss_hash <= 890 and i.i_hash >= 553 and i.i_hash <= 886 and d.d_hash >= 178 and d.d_hash <= 578
;
