select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,store_returns sr,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 115 and ss.ss_hash <= 865 and cd.cd_hash >= 329 and cd.cd_hash <= 729 and hd.hd_hash >= 285 and hd.hd_hash <= 618
;
