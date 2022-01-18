select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 188 and ss.ss_hash <= 938 and hd.hd_hash >= 659 and hd.hd_hash <= 992 and i.i_hash >= 384 and i.i_hash <= 784
;
