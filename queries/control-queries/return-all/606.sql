select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 49 and ss.ss_hash <= 449 and d.d_hash >= 268 and d.d_hash <= 601 and hd.hd_hash >= 227 and hd.hd_hash <= 977
;
