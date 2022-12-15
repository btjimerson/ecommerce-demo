package dev.snbv2.payments;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PaymentController {
    
    private static final Log LOG = LogFactory.getLog(PaymentController.class);

    @Autowired
    PaymentRepository paymentRepository;
    
    @GetMapping("/payments")
    public @ResponseBody List<Payment> getAllPayments() {

        Iterable<Payment> paymentIterator = paymentRepository.findAll();
        List<Payment> payments = new ArrayList<Payment>();

        for (Payment p : paymentIterator) {
            payments.add(p);
        }

        LOG.debug(String.format("All payments found = [%s]", payments));
        return payments;
    }

    @GetMapping("/payments/{id}")
    public @ResponseBody Payment getPaymentById(@PathVariable("id") UUID id) {

        Optional<Payment> payment =  paymentRepository.findById(id);

        if (payment.isPresent()) {
            LOG.debug(String.format("Found payment [%s].", payment.get()));
            return payment.get();
        } else {
            LOG.debug("Payment not found.");
            return new Payment();
        }
    }
}
