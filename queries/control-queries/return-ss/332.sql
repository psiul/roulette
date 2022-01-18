select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 322 and ss.ss_hash <= 655 and hd.hd_hash >= 201 and hd.hd_hash <= 951 and d.d_hash >= 14 and d.d_hash <= 414
;
