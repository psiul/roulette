select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 5 and ss.ss_hash <= 755 and hd.hd_hash >= 267 and hd.hd_hash <= 667 and i.i_hash >= 546 and i.i_hash <= 879
;
