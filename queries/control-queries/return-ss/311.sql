select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 182 and ss.ss_hash <= 932 and d.d_hash >= 577 and d.d_hash <= 910 and c.c_hash >= 538 and c.c_hash <= 938
;
