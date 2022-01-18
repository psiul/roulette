select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 193 and ss.ss_hash <= 943 and c.c_hash >= 562 and c.c_hash <= 895 and hd.hd_hash >= 187 and hd.hd_hash <= 587
;
