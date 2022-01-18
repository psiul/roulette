select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 386 and ss.ss_hash <= 886 and i.i_hash >= 521 and i.i_hash <= 721
;
