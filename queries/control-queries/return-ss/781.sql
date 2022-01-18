select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 93 and ss.ss_hash <= 493 and c.c_hash >= 215 and c.c_hash <= 965 and hd.hd_hash >= 374 and hd.hd_hash <= 707
;
